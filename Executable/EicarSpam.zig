const std = @import("std");

pub fn main() !void {
    const allocator = std.heap.page_allocator;

    const part2 = "!$H+H*";
    const part1 = "X5O!P%@AP[4\\PZX54(P^)7CC)7}$";
    const eicar = try std.fmt.allocPrint(allocator, "{s}EICAR-STANDARD-ANTIVIRUS-TEST-FILE{s}", .{part1, part2});
    
    var i: u32 = 0;
    while (i < 300) : (i += 1) {
        const filename = try std.fmt.allocPrint(allocator, "file_{}.txt", .{i+1});
        defer allocator.free(filename);
        
        var file = try std.fs.cwd().createFile(filename, .{});
        defer file.close();
        
        _ = try file.write(eicar);
    }
}
