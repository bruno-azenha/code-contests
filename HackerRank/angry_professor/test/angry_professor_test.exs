defmodule AngryProfessorTest do
  use ExUnit.Case
  doctest AngryProfessor

  test "greets the world" do
    assert AngryProfessor.hello() == :world
  end
end
