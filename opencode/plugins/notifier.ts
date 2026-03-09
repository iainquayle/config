import type { Plugin } from "@opencode-ai/plugin";

export const NotifierPlugin: Plugin = async ({ $, client }) => {
  client.app.log("Starting notifier")

  return {
    event: async ({ event }) => {
      // Extract session info if available
      const sessionId = event.properties?.sessionID || null;
      let urgency = "normal";
      let duration = "10000";
      let icon = "dialog-information";
      let title = "OpenCode Update";
      let message = "";
      let voiceMessage = "";
      let sessionTitle = "Untitled Session";
      //let sessionTitle = event.properties?.info?.title ?? "Untitled Session";
      if (sessionId) {
        const sessions = await client.session.list();
        const session = sessions.data?.find(s => s.id === sessionId);
        sessionTitle = session?.title || "Failed to Get Title";
      }


      switch (event.type) {
        case "session.idle":
          urgency = "normal";
          icon = "dialog-information";
          title = "✅ Task Finished";
          message = `Session done: ${sessionTitle}`;
          voiceMessage = "Task complete.";
          break;

        case "permission.asked":
          urgency = "critical";
          icon = "dialog-warning";
          title = "⚠️ Permission Required";
          duration = "20000";
          message = `Permission in: ${sessionTitle}`;
          voiceMessage = "Permission required.";
          break;

        case "question.asked":
          urgency = "critical"
          icon = "dialog-warning";
          title = "❓ Question for You";
          duration = "20000";
          message = `Question in: ${sessionTitle}`;
          voiceMessage = "I have a question for you.";
          break;

        case "session.error":
          urgency = "critical"
          icon = "dialog-error";
          title = "❌ Session Error";
          duration = "20000";
          message = `Error in: ${sessionTitle}`;
          voiceMessage = "An error occurred.";
          break;

        default:
          return; // Ignore other events like heartbeats
      }

      try {
        await $`notify-send -a OpenCode -t ${duration} -u ${urgency} -i utilities-terminal "${title}" "${message}"`;
        
        // Voice Notification (requires espeak-ng)
        //await $`espeak-ng "${voiceMessage}" &`; 
      } catch (err) {
        console.error("Failed to send Linux notification:", err);
      }
    },
  };
};
