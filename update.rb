require 'yaml'

$continue = true
def continue_check
  puts '******************************'
  puts 'Exit now? (y/n)'
  ans = gets.chomp
  if ans.match(/^y|Y/) then
    $continue = false
  end
end

def get_projects_map
  YAML.load(File.read("svn_projects.yml"))
end

def prompt_updates
  projects = get_projects_map
  projects.keys.each do |project|
    puts '******************************'
    puts 'Update ' + project + ' ? (y/n)'
    ans = gets.chomp
    if ans.match(/^y|Y/) then
      do_update projects[project]
    end
  end
end

def do_update(path)
  system 'svn update ' + path
end

while ($continue) do
  prompt_updates
  puts
  continue_check
end
