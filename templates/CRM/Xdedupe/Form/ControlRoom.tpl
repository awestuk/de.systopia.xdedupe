{*-------------------------------------------------------+
| SYSTOPIA's Extended Deduper                            |
| Copyright (C) 2019 SYSTOPIA                            |
| Author: B. Endres (endres@systopia.de)                 |
| http://www.systopia.de/                                |
+--------------------------------------------------------+
| This program is released as free software under the    |
| Affero GPL license. You can redistribute it and/or     |
| modify it under the terms of this license which you    |
| can read by viewing the included agpl.txt or online    |
| at www.gnu.org/licenses/agpl.html. Removal of this     |
| copyright header is strictly prohibited without        |
| written permission from the original author(s).        |
+-------------------------------------------------------*}

{* RUN ID *}
{$form.auto_dedupe_run.html}

{* MAIN CRITERIA *}
<div class="xdedupe-config">
  <h2>{ts domain="de.systopia.xdedupe"}Search Criteria{/ts}</h2>
  <div class="crm-section">
    <div class="label">{$form.finder_1.label}</div>
    <div class="content">{$form.finder_1.html}</div>
    <div class="clear"></div>
  </div>
  <div class="crm-section">
    <div class="label">{$form.finder_2.label}</div>
    <div class="content">{$form.finder_2.html}</div>
    <div class="clear"></div>
  </div>
  <div class="crm-section">
    <div class="label">{$form.finder_3.label}</div>
    <div class="content">{$form.finder_3.html}</div>
    <div class="clear"></div>
  </div>
</div>

{* FILTERS *}
<div class="xdedupe-config">
  <h2>{ts domain="de.systopia.xdedupe"}Matching Filters{/ts}</h2>
  <div class="crm-section">
    <div class="label">{$form.contact_type.label}</div>
    <div class="content">{$form.contact_type.html}</div>
    <div class="clear"></div>
  </div>
  <div class="crm-section">
    <div class="label">{$form.contact_group.label}</div>
    <div class="content">{$form.contact_group.html}</div>
    <div class="clear"></div>
  </div>
  <div class="crm-section">
    <div class="label">{$form.contact_tag.label}</div>
    <div class="content">{$form.contact_tag.html}</div>
    <div class="clear"></div>
  </div>
  <div class="crm-section">
    <div class="label">{$form.filters.label}</div>
    <div class="content">{$form.filters.html}</div>
    <div class="clear"></div>
  </div>
</div>

{* MERGE OPTIONS *}
<div class="xdedupe-config">
  <h2>{ts domain="de.systopia.xdedupe"}Merge Options{/ts}</h2>
  <div class="crm-section">
    <div class="label">{$form.force_merge.label}</div>
    <div class="content">{$form.force_merge.html}</div>
    <div class="clear"></div>
  </div>
  <div class="crm-section">
    <div class="label">{$form.main_contact.label}</div>
    <div class="content">{$form.main_contact.html}</div>
    <div class="clear"></div>
  </div>
  <div class="crm-section">
    <div class="label">{$form.auto_resolve.label}</div>
    <div class="content">{$form.auto_resolve.html}</div>
    <div class="clear"></div>
  </div>
</div>


{* RESULTS *}
<div class="xdedupe-config">
  {if $tuples}
    <h2>{ts domain="de.systopia.xdedupe" 1=$result_count 2=$contact_count}%1 results with %2 contacts:{/ts}</h2>
    <table class="xdedupe-preview">
      {foreach from=$tuples item=tuple}
        <tr>
          <td>{$tuple.main.image} {$tuple.main.display_name}</td>
          <td>
            {foreach from=$tuple.other item=other}
              {$other.image} {$other.display_name}<br/>
            {/foreach}
          </td>
          <td>
            <span>
              <a href="#" class="action-item crm-hover-button no-popup" title="View">View</a>
              <a href="#" class="action-item crm-hover-button no-popup" title="Merge">Merge</a>
            </span>
          </td>
        </tr>
      {/foreach}
      </tbody>
    </table>
  {else}
    <h2>{ts domain="de.systopia.xdedupe"}No duplicates found!{/ts}</h2>
  {/if}
</div>

{* FOOTER *}
<div class="crm-submit-buttons">
{include file="CRM/common/formButtons.tpl" location="bottom"}
</div>
