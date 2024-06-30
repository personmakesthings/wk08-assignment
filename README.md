# wk08-assignment

This is for the following assignment: Week 8 - Blog (or some such thing) with a Comments Form.



No deployment this week because Vercel have blocked me.


Links:
- [Copy of SQL code](./README/sql-code.sql)


# Reflection

### Using Next.js for the first time
First week using Next.js. Having to compartmentalise server-side and client-side has been awkward to get a handle on, mainly because of how we now *need* to separate things into different components in order to make the `"use server"` or `"use client"` directives work... and then run back and forth between files in the app.



When creating the "Edit Entry" form for the website, I initially wrote the component similar to the server-side "Add Houseplant" form, and I used the `value` HTML/JSX form attribute to populate the form with values from a relevant row from the database table... and then I learned this caused the form to have the values input but not be editable. So I had to split the form into a separate component, client-side, so that it could be edited by the user, which meant I had to go back to what we learned with React forms in previous weeks and write it like a vanilla React component. Then I had to use props to pass form data back and forth from the server-side and client-side to handle populating the form and submitting data from the form. Which is all to say I feel like I'm really juggling a lot of stuff making these projects now, haha.



Having said all that, creating dynamic routes is pretty painless. I like how it's file-system based and I can see the way the pages are nested in my website at a glance from the file explorer panel in Vscode. It's really simple and handy.



### Taking advantage of database automation more
This week and last week I got some very basic functions working that insert or update rows on other tables which have related/linked columns, which I think might be a start in the right direction in terms of automating database tasks. In a future project, I want to try taking advantage of this more by trying to make a database which actually requires many-to-many relationships and justifies using junction tables & having multiple tables updated with new records; mine haven't so far, so these automation functions have been more for practice and don't serve any real use. I should probably try to pick something out as a subject matter that can be categorised or sorted with multiple categories, tags, etc.



### Issues
- When you use Next.js' `redirect()` component, the page loads scrolled down at the same point as the previous page that was loaded. I'll look into how to fix this for future projects.
- I didn't end up using Tailwind CSS for this project because I'm not confident about using it at this stage, but I will continue to experiment with it.



And that's it for this week.