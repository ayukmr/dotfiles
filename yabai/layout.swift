// =====================
// === Switch Layout ===
// =====================

import Carbon

let args = CommandLine.arguments

if args.count < 2 {
    // no layout given
    exit(1)
}

// target layout
let target = args[1].lowercased()

// available sources
let sources = TISCreateInputSourceList(nil, false)?.takeRetainedValue() as! [TISInputSource]

for source in sources {
    if let namePtr = TISGetInputSourceProperty(source, kTISPropertyLocalizedName) {
        let name = Unmanaged<CFString>.fromOpaque(namePtr).takeUnretainedValue() as String

        if name.lowercased() == target {
            // select layout
            TISSelectInputSource(source)
            exit(0)
        }
    }
}

exit(1)
