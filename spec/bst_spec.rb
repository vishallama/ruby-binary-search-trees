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

      it 'the inserted node is set as the root' do
        expect(BST.new.insert(node1).root).to eq(node1)
      end
    end

    context 'When three different nodes are inserted into an empty tree' do
      let(:node1) { Node.new(1) }
      let(:node2) { Node.new(2) }
      let(:node3) { Node.new(3) }
      let(:bst) { BST.new.insert(node2, node1, node3) }

      it 'the root is set correctly' do
        expect(bst.root).to eq(node2)
      end

      it 'the left child of the root is set correctly' do
        expect(bst.root.left).to eq(node1)
      end

      it 'the right child of the root is set correctly' do
        expect(bst.root.right).to eq(node3)
      end

      it 'left child of the left child of the root is nil' do
        expect(bst.root.left.left).to eq(nil)
      end

      it 'the right child of the right child of the root is nil' do
        expect(bst.root.right.right).to eq(nil)
      end
    end

    context 'Given a balanced tree with seven nodes' do
      let(:node1) { Node.new(1, 1) }
      let(:node2) { Node.new(2, 2) }
      let(:node3) { Node.new(3, 3) }
      let(:node4) { Node.new(4, 4) }
      let(:node5) { Node.new(5, 5) }
      let(:node6) { Node.new(6, 6) }
      let(:node7) { Node.new(7, 7) }
      let(:sorted_nodes) { [node1, node2, node3, node4, node5, node6, node7] }

      it 'inserts the nodes in the correct order' do
        bst = BST.new.insert(node4, node2, node6, node1, node3, node5, node7)
        expect(bst.map { |x| x }).to eq(sorted_nodes) 
      end
    end

  end

  describe '#each' do
    context 'Given a tree with just a root and a left and a right child' do
      let(:node1) { Node.new(1, 1) }
      let(:node2) { Node.new(2, 2) }
      let(:node3) { Node.new(3, 3) }
      let(:sorted_nodes) { [node1, node2, node3] }
      let(:bst) { BST.new.insert(node2, node1, node3) }

      it 'returns the nodes in sorted order' do
        expect(bst.map { |x| x }).to eq(sorted_nodes)
      end
    end
  end

end

