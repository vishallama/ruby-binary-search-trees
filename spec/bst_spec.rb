# spec/bst_spec.rb
require 'bst'

describe BST do

  describe '#initialize' do
    it 'creates an empty BST with root set to nil' do
      expect(BST.new.root).to eq(nil)
    end
  end

  describe '#insert' do

    context 'When the tree is empty' do
      let(:node1) { Node.new(1) }

      it 'raises ArgumentError if the object is not a Node' do
        expect { BST.new.insert(1) }.to raise_error ArgumentError
      end

      it 'the inserted node is set as the root' do
        expect(BST.new.insert(node1).root).to eq(node1)
      end
    end

    context 'When three different nodes are inserted into an empty tree' do
      let(:node1) { Node.new(1) }
      let(:node2) { Node.new(2) }
      let(:node3) { Node.new(3) }
      let(:bst) { BST.new.insert(node2).insert(node1).insert(node3) }

      it 'the root is set correctly' do
        expect(bst.root).to eq(node2)
      end

      it 'the left child of the root is set correctly' do
        expect(bst.root.left).to eq(node1)
      end

      it 'the right child of the root is set correctly' do
        expect(bst.root.right).to eq(node3)
      end
    end

  end
end

