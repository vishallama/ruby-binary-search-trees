# spec/node.rb
require 'node'

describe Node do

  describe '#initialize' do
    context 'When only one argument is passed' do
      it 'the argument is set to key' do
        expect(Node.new(1, 1).key).to eq(1)
      end
    end

    context 'When two arguments are passed' do
       let(:node2) { Node.new(2, 2) }
       let(:node1) { Node.new(1, 1, node2) }

       it 'the first argument is set to key' do
         expect(node1.key).to eq(1)
       end

       it 'the second argument is set to left' do
         expect(node1.left).to eq(node2)
       end
        it 'the third argument is set to nil' do
          expect(node1.right).to eq(nil)
        end
    end

     context 'When four arguments are passed' do
       let(:node2) { Node.new(2, 2) }
       let(:node3) { Node.new(3, 3) }
       let(:node1) { Node.new(1, 1, node2, node3) }

       it 'the first argument is set to key' do
         expect(node1.key).to eq(1)
       end

       it 'the second argument is set to left' do
         expect(node1.left).to eq(node2)
       end

       it 'the third argument is set to right' do
         expect(node1.right).to eq(node3)
       end
     end
  end

  describe '<=>' do
    let(:node2) { Node.new(2, 2) }
    let(:node3) { Node.new(3, 3) }

    context 'when < is used to compare two nodes' do
      it 'returns true if left.data is less than right.data' do
        expect(node2 < node3).to be true
      end
      
      it 'returns false if left.data is greater than or equal to right.data' do
        expect(node3 < node2).to be false
      end
    end
  end

  describe '#insert' do
    let(:node2) { Node.new(2, 2) }
    let(:node3) { Node.new(3, 3) }

    context 'When nil is inserted' do
      it 'raises RuntimeError' do
        expect { node2.insert(nil) }.to raise_error RuntimeError
      end
    end

    context 'When an integer is inserted' do
      it 'raises RuntimeError' do
        expect { node2.insert(1) }.to raise_error RuntimeError
      end
    end

    context 'When a new node is inserted to a node with no children' do
      it 'it is inserted to the right if the data is greater' do
        expect(node2.insert(node3).right).to eq(node3)
      end

      it 'it is inserted to the left if the data is lesser' do
        expect(node3.insert(node2).left).to eq(node2)
      end
    end

    context 'When a new node with the same key is inserted' do
      it 'self is returned' do
        expect(node2.insert(node2)).to eq(node2)
      end
    end
  end

  describe '#traverse_inorder' do
    context 'With a node with just a left child and a right child' do
      let(:node1) { Node.new(1) }
      let(:node2) { Node.new(2) }
      let(:node3) { Node.new(3) }

    end
  end

end

