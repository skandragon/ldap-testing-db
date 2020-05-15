for l in /ldap/modules/*; do
  case "$l" in
    *.ldif)  echo "SETUP: adding $l";
            slapadd -n 0 -l $l
            ;;
    *)      echo "SETUP: ignoring $l" ;;
  esac
done

for l in /ldap/ldif/*; do
  case "$l" in
    *.ldif)  echo "SETUP: adding $l";
            slapadd -l $l
            ;;
    *)      echo "SETUP: ignoring $l" ;;
  esac
done
