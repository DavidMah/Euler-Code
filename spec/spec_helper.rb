require 'yaml'
ROOT     = File.join(File.dirname(__FILE__), "..")
PROBLEMS = YAML.load_file("answers.yml")

def determine_directory(problem_index)
  lower = problem_index - (problem_index % 10)
  upper = lower + 9
  lower = 1 if lower == 0

  upper = pad_zeroes(upper.to_s)
  lower = pad_zeroes(lower.to_s)

  "/#{lower}\\ -\\ #{upper}/" end

def try_problem(directory, problem)
  `ruby #{File.join(ROOT, directory, problem)}`.chomp
end

def test_problem(problem_index)
  problem_name = PROBLEMS[problem_index].first
  answer       = PROBLEMS[problem_index].last
  it "should get #{answer} for problem #{problem_name}" do
    try_problem(determine_directory(problem_index), "#{problem_name}.rb").should == answer.to_s end
end


## Misc Crap

def pad_zeroes(input)
  until input.length >= 3
    input = "0#{input}"
  end
  input
end
