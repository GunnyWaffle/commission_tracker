<table>
    % if current_user["is_artist"]:
        <tr><th colspan="2">Commissions assigned to me:</th></tr>
        % include("commissions_div.tpl", commissions=commissions["my_commissions"], queue_name="my_commissions", current_user_role=current_user["role"], users=users)
    % end

    <tr><th colspan="2">Available commissions:</th></tr>
    % include("commissions_div.tpl", commissions=commissions["available_commissions"], queue_name="available_commissions", current_user_role=current_user["role"], users=users)

    % for user, d in commissions["other_commissions"].items():
        % if current_user["full_name"] != user:
        <tr>
            <th colspan="2">{{ user }}'s commissions:</th>
            <th>
                <span class="user_meta_header accepted" title="Assigned">✋: {{ d["meta"]["assigned"] }}</span>&nbsp;&nbsp;&nbsp;
                <span class="user_meta_header invoiced" title="Emailed/Invoiced">📮: {{ d["meta"]["invoiced"] }}</span>&nbsp;&nbsp;&nbsp;
                <span class="user_meta_header paid" title="Paid">💸: {{ d["meta"]["paid"] }}</span>&nbsp;&nbsp;&nbsp;
                <span class="user_meta_header not_accepted" title="Not Yet Accepted">❌: {{ d["meta"]["not_accepted"] }}</span>
            </th>
        </tr>
        % include("commissions_div.tpl", commissions=d["commissions"], queue_name="other_commissions", current_user_role=current_user["role"], users=users)
        % end
    % end

    <tr><th colspan="2">Finished commissions:</th></tr>
    % include("commissions_div.tpl", commissions=commissions["finished_commissions"], queue_name="finished_commissions", current_user_role=current_user["role"], users=users)
</table>