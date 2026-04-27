namespace Xenon2Modern;

static class Program
{
    /// <summary>
    ///  The main entry point for the application.
    /// </summary>
    [STAThread]
    static void Main(string[] args)
    {
        if (AssetDiagnosticsExporter.TryRun(args, out var exitCode))
        {
            Environment.ExitCode = exitCode;
            return;
        }

        // To customize application configuration such as set high DPI settings or default font,
        // see https://aka.ms/applicationconfiguration.
        ApplicationConfiguration.Initialize();
        Application.Run(new GameForm());
    }    
}