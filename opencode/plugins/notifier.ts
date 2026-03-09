import type { Plugin } from "@opencode-ai/plugin";

export const NotifierPlugin: Plugin = async ({ $, client }) => {
  client.app.log("Starting notifier")

  return {
    event: async ({ event }) => {
      // Extract session info if available
      const sessionId = event.properties?.sessionID || "Unknown Session";
      let urgency = "normal";
      let duration = "3000";
      let icon = "dialog-information";
      let title = "OpenCode Update";
      let message = "";
      let voiceMessage = "";
      let sessionTitle = "Untitled Session";

      try {
        const session = await client.sessions.get(event.sessionId);  
        if (session && session.title) {
          sessionTitle = session.title;
        } else {
          //sessionTitle = 
        }
      } catch(e) { sessionTitle = "Error Fetching Title"; }

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
          message = `Permission in: ${sessionTitle}`;
          voiceMessage = "Permission required.";
          break;

        case "question.asked":
          urgency = "critical"
          icon = "dialog-warning";
          title = "❓ Question for You";
          message = `Question in: ${sessionTitle}`;
          voiceMessage = "I have a question for you.";
          break;

        case "session.error":
          urgency = "critical"
          icon = "dialog-error";
          title = "❌ Session Error";
          message = `Error in: ${sessionTitle}`;
          voiceMessage = "An error occurred.";
          break;

        default:
          return; // Ignore other events like heartbeats
      }

      try {
        await $`notify-send -a OpenCode -u ${urgency} -i utilities-terminal "${title}" "${message}"`;
        
        // Voice Notification (requires espeak-ng)
        //await $`espeak-ng "${voiceMessage}" &`; 
      } catch (err) {
        console.error("Failed to send Linux notification:", err);
      }
    },
  };
};
