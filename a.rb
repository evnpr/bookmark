content = File.read('loggit')
bCD = false #beforeCommitDescription
u = 0
i = 0
content.each_line do |c|
    i = i + 1
    if bCD == true 
        if c =~ /^\s*$/ 
            bCD = false 
           # notifs = Apps.where(:name => @apps_name).first.notifs
           # notifs.each do |n|
           #    Notif.find(n.id).destroy
           # end
            if @commitMessage
                u = u + 1
            end
        else
            @commitMessage = c          #this is the real commit 
        end
    else
        if c =~ /^\s*$/
            bCD = true 
        else                        #to get the other parameters
            if c.include? "commit"
                codeCommit = c.split(" ")[1]
            elsif c.include? "Author"
                author = c.split(" ")[1]
            elsif c.include? "Date"
                date = c.split(" ")[1]
            end
        end
    end
end

puts u
puts i






