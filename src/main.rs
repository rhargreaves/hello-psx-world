#![no_std]
#![no_main]

use psx::Framebuffer;
use psx::dprintln;

const SCREEN_WIDTH: i16 = 320;
const SCREEN_HEIGHT: i16 = 240;
const FONT_WIDTH: i16 = 8;
const FONT_HEIGHT: i16 = 8;

const MSG: &str = "hello world";

#[unsafe(no_mangle)]
fn main() {
    let mut fb = Framebuffer::default();
    let font = fb.load_default_font();

    let text_width = MSG.len() as i16 * FONT_WIDTH;
    let text_height = FONT_HEIGHT;

    let center_x = (SCREEN_WIDTH - text_width) / 2;
    let center_y = (SCREEN_HEIGHT - text_height) / 2;

    let mut txt = font.new_text_box((center_x, center_y), (text_width, text_height));

    loop {
        txt.reset();
        dprintln!(txt, "{}", MSG);
        fb.draw_sync();
        fb.wait_vblank();
        fb.swap();
    }
}
