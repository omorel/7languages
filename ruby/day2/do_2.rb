#Tree class 
class Tree 
  attr_accessor :name, :children
  
  def initialize (structure = {})
    @name = structure.keys[0]
    @children = structure[@name].collect {|key, value| Tree.new ({key => value})}
  end 
  
  def visit_all (&block)
    visit &block
    @children.each {|child| child.visit_all &block}
  end 
  
  def visit (&block)
    block.call self 
  end 
end 

#initialize test variable 
t = Tree.new(
  {
    'grandpa' => 
      {
        'dad' => 
        {
          'child 1' => {}, 
          'child 2' => {}
        }, 
        'uncle' => {
          'child 3' => {}, 
          'child 4' => {}
        },
      }
  }
)

t.visit_all {|node| puts node.name}