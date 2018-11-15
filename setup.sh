#!/bin/bash

# If you decided to have a look at this "amazing setup script" sorry
# it is not really amazing. It just works.

sudo chmod u+x ./main/hack*sh
echo "#!/bin/bash" | tee -a ./capee.sh
echo "           " | tee -a ./capee.sh
echo "rm ./hack*sh"| tee -a ./capee.sh
echo "cp ./main/hack*sh ./." | tee -a ./capee.sh
echo "./hack-sh" |tee -a ./capee.sh
sudo chmod u+x ./capee.sh
rm setup.sh
