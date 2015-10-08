defmodule PhoenixPractice.Mixfile do
  use Mix.Project

  def project do
    [app: :phoenix_practice,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     preferred_cli_env: [espec: :test],
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {PhoenixPractice, []},
     applications: app_list(Mix.env)]
  end

  def app_list do
    [:phoenix, :phoenix_html, :cowboy, :logger, :phoenix_ecto, :postgrex]
  end

  def app_list(:test), do: [:hound | app_list]
  def app_list(_),     do: app_list

  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [{:phoenix, "~> 1.0.2"},
     {:phoenix_ecto, "~> 1.1"},
     {:postgrex, ">= 0.0.0"},
     {:phoenix_html, "~> 2.1"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:espec_phoenix, "~> 0.1.7", only: :test, app: false},
     {:hound, "~> 0.7", only: :test},
     {:cowboy, "~> 1.0"}]
  end
end
