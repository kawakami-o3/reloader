defmodule Reloader do
  def main([]) do

    path = "/path/to/this/project"
    :fs.start_link(:my_watcher, Path.absname(path))
    :fs.subscribe(:my_watcher)

    loop()
  end

  defp loop() do
    IO.puts("watching...")
    receive do
      {_watcher_process, {:fs, :file_event}, {changedFile, _type}} ->
        if match?(changedFile) do
          mix_compile()
        end
    end

    loop()
  end

  defp match?(path) do
    path = to_string(path)
    String.match?(path, ~r{\.ex$}) and !String.match?(path, ~r{(^|/)_build/})
  end

  defp mix_compile() do
    Mix.Task.reenable("compile.elixir")    
    Mix.Project.build_structure
    Mix.Task.run("compile.elixir")
  end

end
