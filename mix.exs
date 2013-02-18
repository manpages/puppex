defmodule Puppex.Mixfile do
  use Mix.Project

  def project do
    [ app: :puppex,
      version: "0.0.1",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [
      applications: List.foldl(deps!, [], function do 
        {{app, _source}, :req}, acc0 -> [app|acc0]
        _, acc0 -> acc0
      end) ++ [:mix] ++ env_apps(Mix.env),
#!      mod: {Chequerl.App, []}
    ]
  end

  defp env_apps(:dev), do: [:exreloader]
  defp env_apps(_), do: []

  defp deps do
    Enum.map deps!, fn(x) -> :erlang.element(1, x) end
  end

  defp deps! do
    [
      {{:genx, github: "yrashk/genx"}, :req},
      {{:xup, github: "yrashk/xup"}, :req},
      {{:erlgit, github: "gleber/erlgit"}, :req},                                                                          
       {{:erlsemver, github: "gleber/erlsemver"}, :nreq},
       {{:sh, github: "gleber/sh"}, :nreq},
     {{:exconfig, github: "yrashk/exconfig"}, :req},
     {{:exreloader, github: "yrashk/exreloader"}, :nreq},
    ]
  end
end
