
#!/bin/bash

deleteFun(){
            for entry in "$1"/*
            do
            if [[ -e $entry &&  -d $entry && ! (-z "$(ls -A $entry)") ]] 
                 then
                    deleteFun $entry $2
            else   
                size=$(stat -c %s $entry)
                if (( $size>$2))
                then
                    rm $entry
                fi
           fi  
            done
}

analytics(){
            for entry in "$1"/*
            do
            if [[ -e $entry &&  -d $entry && ! (-z "$(ls -A $entry)") ]] 
                 then
                    analytics $entry $2
            else   
                 count=$((count+ $(grep  -o  -E   "$regex" $entry | wc -l )))
            fi
             done
            
}

arrange(){
        for entry in "$1"/*
            do
            if [[ -e $entry &&  -d $entry && ! (-z "$(ls -A $entry)") ]] 
                 then
                  arrange $entry $2
                  else
                     find   $1 -name "*.$type"  -exec mv -t $2 {} +
                 fi
          done
          
}

     echo  Enter the directory name
     read search_dir
   if [[ -e $search_dir &&  -d $search_dir && ! (-z "$(ls -A $search_dir)")  ]]
     then 
      while true
        do
            echo "plaes enter the operation del for delete ,  arr for arrange and anly for analytics . Or exit to end the secript"
            read operation
                case "$operation" in

                "del")
                    echo "please enter the maximam size"
                    read maxSize
                    deleteFun $search_dir $maxSize
                 ;;
                "anly") 
                echo "please enter the regex"
                    read regex
                    count=0
                analytics $search_dir $regex
                echo $count
                   ;;
              "arr") 
                    echo "please enter the new file name "
                    read fileName
                    mkdir $fileName
                    echo "please enter the type file "
                    read type
                    arrange $search_dir $fileName
                   ;;
               "exit") 
             
                 break
                    ;;
                *)
                echo "Not a valid argument try again"
                 ;;
                esac
        done
 else   
 echo "invalid directory name try again :"   
     fi


