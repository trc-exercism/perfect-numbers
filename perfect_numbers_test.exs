if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("perfect_numbers.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule PerfectNumbersTest do
  use ExUnit.Case

  describe "Perfect numbers" do
    #@tag :pending
    test "Smallest perfect number is classified correctly" do
      assert PerfectNumbers.classify(6) == { :ok, :perfect }
    end

    # @tag :pending
    test "Medium perfect number is classified correctly" do
      assert PerfectNumbers.classify(28) == { :ok, :perfect }
    end

    # @tag :pending
    test "Large perfect number is classified correctly" do
      assert PerfectNumbers.classify(33550336) == { :ok, :perfect }
    end
  end

  describe "Abundant numbers" do
    # @tag :pending
    test "Smallest abundant number is classified correctly" do
      assert PerfectNumbers.classify(12) == { :ok, :abundant }
    end

    # @tag :pending
    test "Medium abundant number is classified correctly" do
      assert PerfectNumbers.classify(30) == { :ok, :abundant }
    end

    # @tag :pending
    test "Large abundant number is classified correctly" do
      assert PerfectNumbers.classify(33550335) == { :ok, :abundant }
    end
  end

  describe "Deficient numbers" do
    # @tag :pending
    test "Smallest prime deficient number is classified correctly" do
      assert PerfectNumbers.classify(2) == { :ok, :deficient }
    end

    # @tag :pending
    test "The number 16 should be deficient" do
      assert PerfectNumbers.classify(16) == { :ok, :deficient }
    end

    # @tag :pending
    test "Smallest non-prime deficient number is classified correctly" do
      assert PerfectNumbers.classify(4) == { :ok, :deficient }
    end

    # @tag :pending
    test "Medium deficient number is classified correctly" do
      assert PerfectNumbers.classify(32) == { :ok, :deficient }
    end

    # @tag :pending
    test "Large deficient number is classified correctly" do
      assert PerfectNumbers.classify(33550337) == { :ok, :deficient }
    end

    # @tag :pending
    test "Edge case (no factors other than itself) is classified correctly" do
      assert PerfectNumbers.classify(1) == { :ok, :deficient }
    end
  end

  describe "Invalid inputs" do
    # @tag :pending
    test "Zero is rejected (not a natural number)" do
      assert PerfectNumbers.classify(0) == { :error, "Classification is only possible for natural numbers." }
    end

    # @tag :pending
    test "Negative integer is rejected (not a natural number)" do
      assert PerfectNumbers.classify(-1) == { :error, "Classification is only possible for natural numbers." }
    end
  end
end
