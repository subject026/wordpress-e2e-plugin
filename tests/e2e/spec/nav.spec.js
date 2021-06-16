/**
 * External dependencies
 */
import path from "path";
import fs from "fs";
import os from "os";
import uuid from "uuid/v4";

/**
 * WordPress dependencies
 */
import { clickButton, createNewPost } from "@wordpress/e2e-test-utils";

/**
 * Internal dependencies
 */

test("tests", async () => {
  // Create a new post and add the AR Viewer block.
  // await createNewPost();
  await page.goto("http://localhost:8888");
  const header = await page.$eval("h1", header => header.textContent);
  expect(true).toBe(true);
  expect(header).toBe("2_wp-env");
});
