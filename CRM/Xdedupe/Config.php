<?php
/*-------------------------------------------------------+
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
+--------------------------------------------------------*/

use CRM_Xdedupe_ExtensionUtil as E;

use Civi\API\Events;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use \Civi\Core\Event\GenericHookEvent;

/**
 * Implement the general configuration
 */
class CRM_Xdedupe_Config  implements EventSubscriberInterface {

  /**
   * Subscribe to the list events, so we can plug the built-in ones
   */
  public static function getSubscribedEvents() {
    return [
        'civi.xdedupe.finders'   => ['addBuiltinFinders',   Events::W_MIDDLE],
        'civi.xdedupe.filters'   => ['addBuiltinFilters',   Events::W_MIDDLE],
        'civi.xdedupe.resolvers' => ['addBuiltinResolvers', Events::W_MIDDLE],
        'civi.xdedupe.pickers'   => ['addBuiltinPickers',   Events::W_MIDDLE],
    ];
  }

  /**
   * Return the list of built-in finders
   */
  public function addBuiltinFinders(GenericHookEvent $xdedupe_list) {
    $xdedupe_list->list = array_merge($xdedupe_list->list, [
        'CRM_Xdedupe_Finder_Email',
        'CRM_Xdedupe_Finder_LastName',
        'CRM_Xdedupe_Finder_OrganizationName',
        'CRM_Xdedupe_Finder_BirthDate',
        'CRM_Xdedupe_Finder_FirstName',
        'CRM_Xdedupe_Finder_PostalCode',
        'CRM_Xdedupe_Finder_PostalCodeCity',
        'CRM_Xdedupe_Finder_PostalCodeStreet',
        'CRM_Xdedupe_Finder_PostalCodeStreetCity',
    ]);
  }

  /**
   * Return the list of built-in filters
   */
  public function addBuiltinFilters(GenericHookEvent $xdedupe_list) {
    $xdedupe_list->list = array_merge($xdedupe_list->list, [
        'CRM_Xdedupe_Filter_DedupeException',
        'CRM_Xdedupe_Filter_UserAccounts'
    ]);
  }

  /**
   * Return the list of built-in resolvers
   */
  public function addBuiltinResolvers(GenericHookEvent $xdedupe_list) {
    $xdedupe_list->list = array_merge($xdedupe_list->list, [
        'CRM_Xdedupe_Resolver_ExternalIdentifier',
        'CRM_Xdedupe_Resolver_Language',
        'CRM_Xdedupe_Resolver_OrganisationName',
        'CRM_Xdedupe_Resolver_DropSamePhones',
    ]);
  }

  /**
   * Return the list of built-in pickers
   */
  public function addBuiltinPickers(GenericHookEvent $xdedupe_list) {
    $xdedupe_list->list = array_merge($xdedupe_list->list, [
        'CRM_Xdedupe_Picker_Oldest',
    ]);
  }

}