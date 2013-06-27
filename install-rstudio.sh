# Uncomment line in yum.repos.d
sed '/16/#/d' /etc/yum.repos.d/CentOS-Base.repo

# Update yum
yum clean all
yum check-update

# Get Epel package
wget -O /tmp/epel-release-6-8.noarch.rpm http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
yum -y install /tmp/epel-release-6-8.noarch.rpm

# Create symbolic link
ln -s /etc/default/hadoop /etc/profile.d/hadoop.sh

# Something (???)
cat /etc/profile.d/hadoop.sh | sed 's/export //g' > ~/.Renviron

# Download and install RStudio server
wget -O /tmp/rstudio-server-0.97.332-x86_64.rpm http://download2.rstudio.org/rstudio-server-0.97.332-x86_64.rpm
yum -y install -nogpgcheck /tmp/rstudio-server-0.97.332-x86_64.rpm

# Run commands in R to install libs needed for RMR2 (?)
R

# Get rmr2
wget -O /tmp/rmr2_2.1.0.tar.gz
https://github.com/RevolutionAnalytics/rmr2/blob/master/build/rmr2_2.1.0.tar.gz

# Install RMR2
R CMD INSTALL /tmp/rmr2_2.1.0.tar.gz

