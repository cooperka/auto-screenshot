# auto-screenshot

Old Windows batch script/cron job to save screenshots of your working state.

It works, but it's not pretty! I made this a long time ago, around 2008.

## Usage

- Edit the directory specified in `START.bat` to save images where you prefer
- Run `START.bat`

It'll start an invisible command prompt running `screenshot.bat` which, by default, saves a 20% quality JPEG image of your main monitor every 3 minutes (using a shady JAR file I created a long time ago and have since lost the source to... UGH). Each time `screenshot.bat` is started from scratch it will save all images in the current directory into a backup directory.

If a new screenshot is nearly identical to the last one (as determined by file size: `+/- 5 bytes`), the identical screenshot will be thrown out and ignored.

## Motivation

Why would anyone want this?

Well, sometimes it's nice to have backups. Especially if your computer crashes, as Windows has a habit of doing.

- How were my desktop icons arranged last Tuesday?
- What was that site I was just on?
- Where did that giant paragraph of text go in the form I was just filling out?

It's been a life-saver more than once. That's why I don't use Windows anymore.

## Credit

I wrote `screen.bat` myself, generated the screenshot-taking JAR myself (probably with a lot of help from Stack Overflow), and got `invis.vbs` from [here](https://superuser.com/a/62646/90545).
