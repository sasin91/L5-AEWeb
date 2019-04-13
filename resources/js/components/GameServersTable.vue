<script>
	import Swal from 'sweetalert2'

	export default {
		render: function () {
			return this.$scopedSlots.default({
				destroy: (id) => this.confirmActionWithSweetAlert('destroy', id),
				restore: (id) => this.confirmActionWithSweetAlert('restore', id),
				forceDestroy: (id) => this.confirmActionWithSweetAlert('erase', id)
			})
		},

		methods: {
			/**
			 * Confirm an action with a sweet alert popup
			 * 
			 * @param  {String} action
			 * @param  {String|Number|Undefined} id
			 * @return {Mixed}                   
			 */
			async confirmActionWithSweetAlert (action, id) {
				const { value } = await Swal.fire({
					title: `Do you really want to ${action} game server [${id}]?`,
					text: `Confirm that you intend to ${action} game server [${id}].`,
					type: 'question',
					showCancelButton: true
				})

				if (value) {
					await this[action](id)
				}
			},

			async destroy (id) {
				try {
					await axios.delete(`/game-servers/${id}`)
				} catch (error) {
					Swal.fire({
						title: `Could not delete game server [${id}].`,
						text: '',
						type: 'error'
					})

					console.error(error)
				}
			},

			async restore (id) {
				try {
					await axios.post(`/game-servers/${id}?restore=true`)
				} catch (error) {
					Swal.fire({
						title: `Could not restore game server [${id}].`,
						text: '',
						type: 'error'
					})

					console.error(error)
				}	
			},

			async forceDestroy (id) {
				try {
					await axios.delete(`/game-servers/${id}?force=true`)
				} catch (error) {
					Swal.fire({
						title: `Could not delete game server [${id}].`,
						text: '',
						type: 'error'
					})

					console.error(error)
				}
			}
		}
	}
</script>