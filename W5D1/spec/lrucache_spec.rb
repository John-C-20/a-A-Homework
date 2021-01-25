require "rspec"
require  "lrucache"

describe LRUCache do
    subject(:johnny_cache) { LRUCache.new(4) }

    describe "#initialize" do
        it "should take in a size (s) and set size to s" do
            expect(johnny_cache.instance_variable_get(:@size)).to eq(4)
        end 

        it "should set num_elements to 0" do
            expect(johnny_cache.instance_variable_get(:@num_elements)).to eq(0)
        end

        it "should set cache to empty" do
            expect(johnny_cache.instance_variable_get(:@cache).empty?).to be true
        end
    end

    describe "#count" do
        it "should return the number of elements currently in the cache" do
            expect(johnny_cache.count).to eq(0)
            johnny_cache.instance_variable_set(:@num_elements, 2)
            expect(johnny_cache.count).to eq(2)
        end
    end
    
    describe "#add" do
        it "should add an item to the cache" do
            johnny_cache.add("I walk the line")
            expect(johnny_cache.instance_variable_get(:@cache).include?("I walk the line")).to be true
        end
        
        it "should increment num_elements to reflect the new number of elements in the cache" do
            johnny_cache.add("I walk the line")
            johnny_cache.add(5)
            expect(johnny_cache.count).to eq(2)
        end
        
        context "if cache is full" do
            it "should not add more elements to the cache than the size" do
                johnny_cache.add("I walk the line")
                johnny_cache.add(5)
                johnny_cache.add([1,2,3])
                johnny_cache.add(-5)
                johnny_cache.add({a: 1, b: 2, c: 3})
                expect(johnny_cache.count).to eq(4)
            end
            
            it "should remove the Least Recently Used element" do
                johnny_cache.add("I walk the line")
                johnny_cache.add(5)
                johnny_cache.add([1,2,3])
                johnny_cache.add(6)
                johnny_cache.add(-5)
                johnny_cache.add({a: 1, b: 2, c: 3})
                expect(johnny_cache.instance_variable_get(:@cache)).to eq([[1, 2, 3], 6, -5, {a: 1, b: 2, c: 3}])
            end
        end
        
        context "if element to add is already in the hash" do
            it "should not add more than one instance of an item to the cache" do
                johnny_cache.add("I walk the line")
                johnny_cache.add("I walk the line")
                johnny_cache.add(5)
                johnny_cache.add([1,2,3])
                expect(johnny_cache.count).to eq(3)
                expect(johnny_cache.instance_variable_get(:@cache)).to eq(["I walk the line", 5, [1,2,3]])
            end
            
            it "should move the element to most-recent position" do
                johnny_cache.add("I walk the line")
                johnny_cache.add(5)
                johnny_cache.add([1,2,3])
                johnny_cache.add(5)
                johnny_cache.add(-5)
                johnny_cache.add({a: 1, b: 2, c: 3})
                expect(johnny_cache.instance_variable_get(:@cache)).to eq([[1, 2, 3], 5, -5, {a: 1, b: 2, c: 3}])
                johnny_cache.add([1,2,3,4])
                johnny_cache.add("I walk the line")
                johnny_cache.add(:ring_of_fire)
                johnny_cache.add("I walk the line")
                johnny_cache.add({a: 1, b: 2, c: 3})
                expect(johnny_cache.instance_variable_get(:@cache)).to eq([[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}])
            end
        end
    end

    describe "#show" do
        it "should show the cache from Least Recently Used to Most Recently Used" do
            $stdout = StringIO.new
    
            johnny_cache.add([1,2,3])
            johnny_cache.add(6)
            johnny_cache.add(12)
            johnny_cache.add("abc")
            johnny_cache.show
    
            $stdout.rewind   # IOs act like a tape so we gotta rewind before we play it back  
            expect($stdout.gets.chomp).to eq("[[1, 2, 3], 6, 12, \"abc\"]")
        end
        
        it "should not show any nils" do
            $stdout = StringIO.new
            johnny_cache.show
            $stdout.rewind     
            expect($stdout.gets.chomp).to eq("[]")
        end
    end
end
