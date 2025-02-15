needsTarget=true
targetValue=""

for p in "${params[@]}"; do
    case "$p" in
    -target)
        needsTarget=false
        targetValue=$2
        shift 2
        ;;
    --target=*)
        needsTarget=false
        targetValue="${p#*=}"
        ;;
    esac
done

if $needsTarget && [[ $0 != *cpp ]]; then
    extraBefore+=(-target @defaultTarget@ @machineFlags@)
fi
