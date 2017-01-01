# Reloader

This project is for a proof of concept.

Reloader is a minimal auto code reloader like Phoenix.CodeReloader.


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `reloader` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:reloader, "~> 0.1.0"}]
    end
    ```

  2. Ensure `reloader` is started before your application:

    ```elixir
    def application do
      [applications: [:reloader]]
    end
    ```

