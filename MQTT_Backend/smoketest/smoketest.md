## Smoke Test

<br/>

The term "smoke test" originated in hardware repair. A device was turned on, and would fail the smoke test if it caught on fire. Smoke testing is sometimes called "build verification testing".
When applied to web applications, smoke tests verify that the most important functionality is working. 


I will create Playwright and Jest tests on a web application. Playwright is a library built by Microsoft to automate Chromium, Firefox, and WebKit browsers. Jest is a framework for creating and running JavaScript tests.

To quickly create and run our tests, we will use the open source QA Wolf library. QA Wolf converts your browser actions to Playwright/Jest test code. It also runs your tests in a CI provider like GitHub Actions.


useful commands:

```
npm init qawolf //initiate the qawolf
npx qawolf howl //to check if the installation was succesful

```

To create our test, we'll use the `npx qawolf create` command. This command takes the URL of your application and an optional test name. Running this command will open a Chromium browser where your actions will be converted to Playwright/Jest code.

```
npx qawolf create http://todomvc.com/examples/react myFirstTest
```

the code at ".qawolf/myFirstTest.test.js" is where my test code will be created as i use the browser.

<br/>

<br/>
<br/>
<br/>

### reference:
[creating a smoke test](https://www.freecodecamp.org/news/smoke-testing/#create-a-smoke-test)