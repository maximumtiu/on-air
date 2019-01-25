# on-air

This is a fun little tool I'm building that turns a Hue bulb red when I'm in a meeting to easily let my partner know that I'm unavailable. It also updates my Slack status to show my coworkers that I'm in meeting too.

It's not quite public-ready (no user-facing docs yet). Suffice it to say I'm hitting the Google Calendar API to tell if I'm in a meeting (or am about to be), then hitting the Hue API to turn a specific lightbulb to red and hitting the Slack API to update my status. The light-changing functionality is currently only set up to run on my home's local network and will not work on a remote server, but the Slack component will work anywhere.

I heavily borrowed the Google Calendar API config from [their quickstart guide](https://developers.google.com/calendar/quickstart/ruby).
