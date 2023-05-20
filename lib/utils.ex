defmodule Isotope.Utils do
  @moduledoc """
  Utilitary functions for working with noise maps.
  """

  alias Isotope.Noise

  @doc """
  Shows the given noise map on the stdout using ANSI color codes.
  > This won't work if your terminal doesn't support ANSI color codes.

  ```elixir
  {:ok, noise} = Isotope.Noise.new()
  noise |> Isotope.Noise.noise_map({50, 50})
        |> Isotope.Utils.show_noisemap()
  # Outputs noise visualization
  :ok
  ```
  """
  @spec show_noisemap(Noise.noisemap()) :: :ok
  def show_noisemap(noisemap) do
    Enum.each(noisemap, fn y ->
      Enum.each(y, fn x ->
        color = (x * 255) |> floor() |> abs() |> rem(255)
        ansi_char = IO.ANSI.color(color) <> "▒"
        IO.write(ansi_char)
      end)

      IO.puts("")
    end)
  end
end
