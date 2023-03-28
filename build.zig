const std = @import("std");

pub const wasm3_build = @import("libs/zig-wasm3/submod_build_plugin.zig");

pub fn build(b: *std.build.Builder) void {
    const exe = b.addExecutable("uw8", "main.zig");

    const target = b.standardTargetOptions(.{});
    exe.setTarget(target);

    const mode = b.standardReleaseOptions();
    exe.setBuildMode(mode);

    wasm3_build.addTo(exe, "libs/wasm3");
    exe.addPackage(wasm3_build.pkg(null));

    exe.install();
}
