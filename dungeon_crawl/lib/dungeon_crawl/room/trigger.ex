defmodule DungeonCrawl.Room.Trigger do
    @callback run(Character.t, Action.t) :: {Character.t, atom}
end
