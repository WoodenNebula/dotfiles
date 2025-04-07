export EDITOR="nvim"
export VISUAL="nvim"
alias dog="cd /d/Programming/Unreal-Projects/dog_runner/"

function UE() {
  if [[ $# -eq 0 ]]; then 
    UnrealEditor.exe&
  elif [[ "$1" == "." ]]; then
    project_file=$(ls | grep *.uproject)
    if [[ -z "$project_file" ]]; then
      echo "Project File not found in current directory"
    else 
     # extract the project name here
     ext=".uproject"
     project_name="${project_file%$ext}"
     project_path="$(readlink -f $project_file)"

     UnrealBuildTool.exe $project_name Win64 Development -Project=$project_path -WaitMutex -FromMsBuild
     UnrealEditor.exe $project_path&
    fi
  fi
}
