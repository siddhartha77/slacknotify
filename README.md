# slacknotify
Send Slack messages from bash.

Three versions are included. The Python version is the most complete. Others are for specialized installed on devices without curl or Python (e.g. routers).

# Usage

The `hook_path` variable must be changed to your [Webhook URL](https://api.slack.com/messaging/webhooks#getting_started). Then run:

```bash
slacknotify "your message"
```
