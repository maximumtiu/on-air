# on-air

This is a fun little tool I'm building that turns a Hue bulb red when I'm in a meeting to easily let my partner know that I'm unavailable. It also updates my Slack status to show my coworkers that I'm in meeting too.

It's not quite public-ready (no user-facing docs yet). Suffice it to say I'm hitting the Google Calendar API to tell if I'm in a meeting (or am about to be), then hitting the Hue API to turn a specific lightbulb to red and hitting the Slack API to update my status. The light-changing functionality is currently only set up to run on my home's local network and will not work on a remote server, but the Slack component will work anywhere.

I heavily borrowed the Google Calendar API config from [their quickstart guide](https://developers.google.com/calendar/quickstart/ruby).

## Tools

* Ruby 2.3 or later
* RVM
  * Really, this currently can't run with rbenv or another version manager)
* Philips Hue smart lighting system
  * This program is set up to work with one specific bulb.
* Google Calendar
  * You'll need GCal API access. I recommend following [Google's quickstart guide here](https://developers.google.com/calendar/quickstart/ruby) to create a Project and get API keys.
  * Once you've downloaded your credentials from Google, you'll need to set the following environment variables somewhere your in your shell's config (`.bash_profile`, `.bashrc`, `.zshrc`, etc.):

      * `CAL_CREDENTIALS_FILE`: the full path to your `credentials.json` file, including the filename. Like 
      
      ```
      /Users/Megan/Code/on-air/credentials.json
      ```
      
      Note that `~` will not suffice in place of `/Users/Megan`
      
      * `CAL_TOKEN_FILE`: the first time you run this program, the Google API will generate an authorization token for you. This env var should be the full path to where you want that token to be stored, like
      
      ```
      /Users/Megan/Code/on-air/token.yaml
      ```

## Installation

**Requires RVM** and Ruby 2.3 or later

```
git clone https://github.com/megantiu/on-air.git
cd on-air
```

Then, set the required environment variables as outlined in the Tools section. After:

```
bin/install
```
