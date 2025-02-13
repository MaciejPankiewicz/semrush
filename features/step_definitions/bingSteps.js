import { Given, When, Then, Before, After } from "@cucumber/cucumber";
import { expect } from "@playwright/test";
import { chromium } from "playwright";

let browser, page;

Before(async function () {
  browser = await chromium.launch({ headless: false });
  page = await browser.newPage();
});

After(async function () {
  await browser.close();
});

Given("I am on the Bing homepage", async function () {
  await page.goto("https://www.bing.com", { waitUntil: "load" });
});

When("I enter {string} in the search bar", async function (searchTerm) {
  await page.waitForSelector("textarea#sb_form_q", {
    state: "visible",
    timeout: 15000,
  });
  await page.fill("textarea#sb_form_q", searchTerm);
  await page.waitForLoadState("domcontentloaded");
  await page.waitForTimeout(2000); // cure for all problems
});

When("I click the search button", async function () {
  await page.waitForSelector("textarea#sb_form_q", {
    state: "visible",
    timeout: 10000,
  });
  await page.press("textarea#sb_form_q", "Enter");
  await page.waitForLoadState("domcontentloaded");
});

When("I click on the {string} filter", async function (filterCategory) {
  await page.waitForSelector(`#b-scopeListItem-${filterCategory}`, {
    state: "visible",
    timeout: 10000,
  });
  await page.click(`#b-scopeListItem-${filterCategory}`);
  await page.waitForTimeout(2000);
});

Then(
  "I should see search results related to {string} under {string}",
  async function (searchTerm, filterCategory) {
    await page.waitForLoadState("networkidle");
    const pageTitle = await page.title();
    expect(pageTitle.toLowerCase()).toContain(searchTerm.toLowerCase());
  }
);
