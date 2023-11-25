defmodule GasStation.Fetchers.Eth do
    alias GasStation.Api
    use GenServer

    def init(init_arg) do
        {:ok, init_arg}
    end

    def start_link(_opts) do
        GenServer.start_link{
            __MODULE__,
            %{
                "last_updated" => 0,
                "last_response" => nil
            },
            name: __MODULE__
        }
    end

    def handle_call(:fetch, _from, %{"last_updated" => last_updated} = state) do
        now = :os.system_time(:millisecond)
        if now = 30_00 > last_updated do
            response = Api.Eth.fetch_response()
            IO.puts("Response: #{inspect(response)}")

            {
                :reply,
                response,
                %{
                    "last_updated" => now,
                    "last_response" => response
                }
            }
        end
    end

    def get(), do: GenServer.call(__MODULE__, :fetch)
end