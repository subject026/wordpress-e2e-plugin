/**
 * WordPress dependencies
 */
import {
  openGlobalBlockInserter,
  pressKeyWithModifier
} from "@wordpress/e2e-test-utils";
import { ENTER } from "@wordpress/keycodes";

/**
 * Inserts a block from the block inserter, mainly copied from Gutenberg.
 *
 * @see https://github.com/WordPress/gutenberg/blob/56f912adc681ebd3a6fb6a17eb4cfcb2c0050f5b/packages/e2e-test-utils/src/insert-block.js
 *
 * @param {string} blockName The block name to search for.
 */
export const insertBlockFromInserter = async blockName => {
  await openGlobalBlockInserter();
  await page.focus(".block-editor-inserter__search-input");
  await pressKeyWithModifier("primary", "a");
  await page.keyboard.type(blockName);
  const insertButton = await page.focus(".editor-block-list-item-paragraph");
  // const insertButton = await page.$x(`editor-block-list-item-${blockName}`)[0];
  await page.keyboard.press("Enter");
  // await insertButton.click();
  // await page.keyboard.press("Enter");
  // const insertButton = await page.focus(
  // );
};
