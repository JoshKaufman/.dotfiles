fixcamera () {
    sudo killall VDCAssistant
}

unindex () {
  sudo mdutil -a -i off
}
reindex () {
  sudo mdutil -a -i on
}
