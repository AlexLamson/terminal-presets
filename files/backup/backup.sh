#DESCRIPTION
#run the command
#    backup.sh some_directory
#to save all the files in that directory to a backup directory
#or omit the directory name to default to the current directory

#TODO
#add switch to add an annotation to the backup's filename


# Set the source directory to the argument or default to the current directory
if [[ "$1" != "" ]]; then
    SRCDIR="$1"
else
    SRCDIR=.
fi

# Setup the output directory
DESDIR="ALL_BACKUPS~"
FILENAME="backup--$(date +'%Y-%m-%d--%H-%M-%S').tar.gz"
mkdir "$DESDIR" -p

# Make the backup
tar -cpaf $DESDIR/$FILENAME $SRCDIR --exclude=$DESDIR

