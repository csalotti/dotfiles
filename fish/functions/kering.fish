function set_terraformer_sa --on-variable PWD --description "Set proper service terraformer service account"

    # Get top level repository name (if any)
    set REPO_ROOT (git rev-parse --show-toplevel 2>/dev/null)

    set PROD_FOLDERS prod github transversal-prod github_infra shared_dbt_macros tf_workaround_roles
    set DEV_FOLDERS dev transversal-dev

    # Limit to kering infra respo
    if test -n "$REPO_ROOT"; and test (basename "$REPO_ROOT") = "data-platform-infrastructure"
        set CURRENT_FOLDER (basename $PWD)
        if contains "$CURRENT_FOLDER" $PROD_FOLDERS
            echo "[gcp] impersonate terraform-prod"
            set -gx GOOGLE_IMPERSONATE_SERVICE_ACCOUNT terraformer@ke-data-transversal-prod.iam.gserviceaccount.com
        else if contains "$CURRENT_FOLDER" $DEV_FOLDERS
            echo "[gcp] impersonate terraform-dev"
            set -gx GOOGLE_IMPERSONATE_SERVICE_ACCOUNT terraformer@ke-data-transversal-dev.iam.gserviceaccount.com
        else if test -n "$GOOGLE_IMPERSONATE_SERVICE_ACCOUNT"
            # Remove variable when not any appropriate foler
            set -e GOOGLE_IMPERSONATE_SERVICE_ACCOUNT
        end

    end
end
