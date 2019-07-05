# typed: true
module Parlour
  class RbiGenerator
    class RbiObject
      extend T::Helpers
      extend T::Sig
      abstract!

      sig { params(name: String).void }
      def initialize(name)
        @name = name
      end

      sig { returns(String) }
      attr_reader :name

      sig do
        abstract.params(
          indent_level: Integer,
          options: Options
        ).returns(T::Array[String])
      end
      def generate_rbi(indent_level, options); end

      sig do
        abstract.params(
          others: T::Array[RbiGenerator::RbiObject]
        ).returns(T::Boolean)
      end
      def mergeable?(others); end

      sig do 
        abstract.params(
          others: T::Array[RbiGenerator::RbiObject]
        ).void
      end
      def merge_into_self(others); end
    end
  end
end