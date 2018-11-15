#!/bin/bash

# If you decided to have a look at this "amazing setup script" sorry
# it is not really amazing. It just works.

# I have written this setup script to make sure hack-captive.sh works
# as intended. The problem is that if the script fails once, It will always
# fail until you reconnect to another network. This is a simple workaround that
# by deleting and replacing the script fixes the problem.

sudo chmod u+x ./main/hack*sh
echo "#!/bin/bash" | tee -a ./capee.sh
echo "           " | tee -a ./capee.sh
echo "rm ./hack*sh"| tee -a ./capee.sh
echo "cp ./main/hack*sh ./." | tee -a ./capee.sh
echo "./hack*sh" |tee -a ./capee.sh
sudo chmod u+x ./capee.sh
rm setup.sh
