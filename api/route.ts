// ═══════════════════════════════════════════════════════
// API Route: /api/install-skills
// ═══════════════════════════════════════════════════════
//
// Deploy this as a Next.js API route (Vercel) or adapt
// for your preferred serverless platform.
//
// When a user runs:
//   curl -sL yourdomain.com/api/install-skills | bash
//
// This endpoint returns the bash installer script.

import { NextResponse } from "next/server";
import { readFileSync } from "fs";
import { join } from "path";

export async function GET() {
  // Option 1: Serve the bash script from file
  // const script = readFileSync(join(process.cwd(), "api/install-skills.sh"), "utf-8");

  // Option 2: Inline the script (for single-file deployment)
  const script = generateInstallScript();

  return new NextResponse(script, {
    headers: {
      "Content-Type": "text/plain",
      "Cache-Control": "public, max-age=300", // 5 min cache
    },
  });
}

function generateInstallScript(): string {
  // You can dynamically generate the script here,
  // e.g., inject the latest version number, custom config, etc.
  //
  // For production, read from the actual file:
  return readFileSync(join(process.cwd(), "api/install-skills.sh"), "utf-8");
}

// ─── Alternative: Cloudflare Worker version ───
//
// export default {
//   async fetch(request: Request): Promise<Response> {
//     const script = INSTALL_SCRIPT; // KV binding or inline
//     return new Response(script, {
//       headers: { "Content-Type": "text/plain" },
//     });
//   },
// };
