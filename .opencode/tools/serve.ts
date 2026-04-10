import { tool } from "@opencode-ai/plugin"

export default tool({
  description:
    "Start a static file server in the background using npx serve. Returns the PID and URL.",
  args: {
    port: tool.schema
      .number()
      .default(3000)
      .describe("Port to serve on (default: 3000)"),
    directory: tool.schema
      .string()
      .optional()
      .describe("Directory to serve (default: project root)"),
  },
  async execute(args, context) {
    const port = args.port
    const dir = args.directory || context.directory

    const proc = Bun.spawn(["npx", "serve", dir, "-l", String(port)], {
      stdout: "pipe",
      stderr: "pipe",
      cwd: context.directory,
    })

    // Wait briefly to check if the process starts successfully
    await new Promise((r) => setTimeout(r, 2000))

    if (proc.exitCode !== null) {
      const stderr = await new Response(proc.stderr).text()
      return `Failed to start server: ${stderr}`
    }

    return [
      "Server started in background.",
      `  PID: ${proc.pid}`,
      `  URL: http://localhost:${port}`,
      `  Directory: ${dir}`,
      "",
      `To stop: kill ${proc.pid}`,
    ].join("\n")
  },
})
