# Development Notes

This page will be a place to keep development notes and other
information I want to save along with the rest of the code.

## Email Notification for Lost Passwords

I think that this should be a feature of the software, seeing as the
rest of the secure/authorization stuff is meant to be simple.  I want
it work without having to sent to an SMTP server.

I have looked into the following:

- **nslookup** linux system command for discovering the address
  without SMTP.  I haven't figured this out yet, but it seems to
  be the appropriate lowest-level route.

- [An article](http://www.jancarloviray.com/blog/send-email-in-linux-without-an-smtp-server/)
  about sending emails without an SMTP server using the linux
  program **postfix** and **mailutils**.

