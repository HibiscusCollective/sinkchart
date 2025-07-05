#![no_main]

use libfuzzer_sys::fuzz_target;

fuzz_target!(|data: &[u8]| {
    // Try to parse the data as JSON for map serialization fuzzing
    if let Ok(s) = std::str::from_utf8(data) {
        // Test JSON parsing robustness
        let _: Result<serde_json::Value, _> = serde_json::from_str(s);
    }
});
