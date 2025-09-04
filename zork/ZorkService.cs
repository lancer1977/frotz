public class ZorkService
{
    private Process _process;
    private StreamWriter _stdin;

    public void Start()
    {
        _process = new Process
        {
            StartInfo = new ProcessStartInfo
            {
                FileName = "frotz",
                Arguments = "/games/zork1.dat",
                RedirectStandardInput = true,
                RedirectStandardOutput = true,
                UseShellExecute = false,
                CreateNoWindow = true,
            }
        };
        _process.Start();
        _stdin = _process.StandardInput;
        Task.Run(() => ReadOutputLoop());
    }

    public void SendCommand(string command)
    {
        _stdin.WriteLine(command);
    }

    private void ReadOutputLoop()
    {
        while (!_process.StandardOutput.EndOfStream)
        {
            var line = _process.StandardOutput.ReadLine();
            // Broadcast to clients via SignalR here
        }
    }
}
