defmodule Base64.MixProject do
  use Mix.Project

  def project do
    [
      app: :base64,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      compilers: [:rustler] ++ Mix.compilers(),
      rustler_crates: rustler_crates(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler, "~> 0.24.0"}
    ]
  end

  defp rustler_crates do
    [
      base64_nif: [path: "native/base64_nif", mode: if(Mix.env() == :prod, do: :release, else: :debug)]
    ]
  end
end
