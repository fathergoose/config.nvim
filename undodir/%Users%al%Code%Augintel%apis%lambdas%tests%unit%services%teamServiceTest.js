Vim�UnDo� 0�yGA�-��W�70��Aָ�Ӫ擆m���   K   1describe('team-service test', async function () {                             cwT    _�                     .        ����                                                                                                                                                                                                                                                                                                                            .          /          V       cJ�    �   -   .          t             const teamMemberProfile = await Profiles.create({'user_id': teamMember.id, 'agency_id': user.agency.id,   a                'user_type': 'normal', 'group_id': user.group.id, 'manager_id': user.profile.id})5��    -                      o      �               5�_�                    -        ����                                                                                                                                                                                                                                                                                                                            .          .          V       cJ�     �   ,   -          d             const teamMember = await Users.create({'email': `user2@agency.com`, 'is_active': true})5��    ,                      
      e               5�_�                    +   %    ����                                                                                                                                                                                                                                                                                                                            -          -          V       cJ�    �   *   ,   8      C             const { Profiles, Users } = ModelFactory(base.queryDB)5��    *                    �                    5�_�                       2    ����                                                                                                                                                                                                                                                                                                                                                             cwT    �               8    'use strict'       ! const assert = require('assert')    const chai = require('chai')   $     , spies = require('chai-spies')    chai.use(spies);    const expect = chai.expect       -const base = require('../../../app/index.js')   Cconst teamService = require('../../../app/services/teamService.js')   Aconst { ModelFactory } = require('../../../app/models/models.js')   .const testHelper = require('../testHelper.js')       0describe('team-service test', async function() {   0    describe('mock database', async function() {   T          it('returns successful response with profile for user', async function() {   A              const mockDatabase = function(query, queryParams) {                   return {rows: [   �                                {id:1, first_name: 'First', last_name: 'Last', cases: [{id: 1, name: 'Dobson'}], manager_id: 2},   �                                {id:2, first_name: 'Anne', last_name: 'LastName', cases: [{id: 2, name: 'Jones'}], manager_id: 3}                                ]}                 }   =              const { Profiles } = ModelFactory(mockDatabase)       ]              const resp = await teamService.teamHandler('user@abc.com', undefined, Profiles)       '              console.log('resp', resp)   6              assert.strictEqual(resp.statusCode, 200)                 assert(resp.body)             })       })       =    context('connecting to test database', async function() {       %        beforeEach(async function() {   9            const { Models } = ModelFactory(base.queryDB)   )            await Models.dropAllSchemas()   +            await Models.createAllSchemas()   *            await Models.createAllTables()   
        })       N        it('returns successful response with user\'s team', async function() {   <             const { Profiles } = ModelFactory(base.queryDB)   E             const user = await testHelper.createNormalUserInGroup(1)       ]             const resp = await teamService.teamHandler(user.user.email, undefined, Profiles)       5             assert.strictEqual(resp.statusCode, 200)                assert(resp.body)   3             const respBody = JSON.parse(resp.body)   #             assert(respBody.teams)   
        })           })         })5��            7      J              (      ^      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             cwT     �   :   <   K      I    it("returns successful response with user's team", async function() {�   3   5   K      !    beforeEach(async function() {�   2   4   K      ;  context('connecting to test database', async function() {�         K      9      const mockDatabase = function(query, queryParams) {�         K      N    it('returns successful response with profile for user', async function() {�         K      .  describe('mock database', async function() {�         K      0describe('team-service test', async function() {5��    :   E                  �                     �    3                     �                     �    2   7                  �                     �       #                  [                     �       J                  2                     �       *                  �                     �       ,                  �                     5��