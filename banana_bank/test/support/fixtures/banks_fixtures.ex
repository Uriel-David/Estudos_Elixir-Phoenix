defmodule BananaBank.BanksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BananaBank.Banks` context.
  """

  @doc """
  Generate a accounts.
  """
  def accounts_fixture(attrs \\ %{}) do
    {:ok, accounts} =
      attrs
      |> Enum.into(%{
        owner: "some owner",
        number: "some number",
        balance: 42
      })
      |> BananaBank.Banks.create_accounts()

    accounts
  end
end
